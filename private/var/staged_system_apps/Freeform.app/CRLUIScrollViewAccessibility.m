@interface CRLUIScrollViewAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityScrollStatusPrefersVertical;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_accessibilityUseContentInset;
- (BOOL)_crlaxShouldSendScrollStatusUponAnimationEnded;
- (BOOL)accessibilityShouldEnableScrollIndicator:(id)a3;
- (double)_accessibilityScrollAnimationDurationDelay;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityScrollStatusFormatString;
- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5;
- (void)accessibilityScrollLeftPage;
- (void)accessibilityScrollRightPage;
@end

@implementation CRLUIScrollViewAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIScrollView";
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

- (void)accessibilityScrollLeftPage
{
  id v3 = [(CRLUIScrollViewAccessibility *)self accessibilityIdentifier];
  unsigned int v4 = [v3 isEqual:@"nestedVScrollView"];

  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [(CRLUIScrollViewAccessibility *)self superview];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    v6.receiver = self;
    v6.super_class = (Class)CRLUIScrollViewAccessibility;
    [(CRLUIScrollViewAccessibility *)&v6 accessibilityScrollLeftPage];
    return;
  }
  [v5 accessibilityScrollLeftPage];
}

- (void)accessibilityScrollRightPage
{
  id v3 = [(CRLUIScrollViewAccessibility *)self accessibilityIdentifier];
  unsigned int v4 = [v3 isEqual:@"nestedVScrollView"];

  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [(CRLUIScrollViewAccessibility *)self superview];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    v6.receiver = self;
    v6.super_class = (Class)CRLUIScrollViewAccessibility;
    [(CRLUIScrollViewAccessibility *)&v6 accessibilityScrollRightPage];
    return;
  }
  [v5 accessibilityScrollRightPage];
}

- (BOOL)_crlaxShouldSendScrollStatusUponAnimationEnded
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  if ([(CRLUIScrollViewAccessibility *)self crlaxShouldIgnoreSiblingPageControl])goto LABEL_13; {
  id v3 = self;
  }
  unsigned int v4 = [(CRLUIScrollViewAccessibility *)v3 superview];
  id v5 = [v4 subviews];

  NSClassFromString(@"CRLPageControl");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 accessibilityValue];
          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_12:

  if (!v12)
  {
LABEL_13:
    v14.receiver = self;
    v14.super_class = (Class)CRLUIScrollViewAccessibility;
    v12 = [(CRLUIScrollViewAccessibility *)&v14 _accessibilityScrollStatus];
  }

  return v12;
}

- (id)_accessibilityScrollStatusFormatString
{
  id v3 = [(CRLUIScrollViewAccessibility *)self crlaxScrollStatusFormatString];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLUIScrollViewAccessibility;
    id v3 = [(CRLUIScrollViewAccessibility *)&v5 _accessibilityScrollStatusFormatString];
  }

  return v3;
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  [(CRLUIScrollViewAccessibility *)self crlaxScrollAnnouncementDelay];
  if (result <= 0.0)
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLUIScrollViewAccessibility;
    [(CRLUIScrollViewAccessibility *)&v4 _accessibilityScrollAnimationDurationDelay];
  }
  return result;
}

- (BOOL)_accessibilityUseContentInset
{
  v4.receiver = self;
  v4.super_class = (Class)CRLUIScrollViewAccessibility;
  if ([(CRLUIScrollViewAccessibility *)&v4 _accessibilityUseContentInset]) {
    return 1;
  }
  else {
    return [(CRLUIScrollViewAccessibility *)self crlaxUseContentInset];
  }
}

- (BOOL)_accessibilityScrollingEnabled
{
  if ([(CRLUIScrollViewAccessibility *)self crlaxIsScrollingDisabled]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLUIScrollViewAccessibility;
  return [(CRLUIScrollViewAccessibility *)&v4 _accessibilityScrollingEnabled];
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  if (a4
    || ([(CRLUIScrollViewAccessibility *)self accessibilityIdentifier],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [&off_10155C350 containsObject:v10],
        v10,
        v11))
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLUIScrollViewAccessibility;
    -[CRLUIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animated:](&v14, "accessibilityApplyScrollContent:sendScrollStatus:animated:", v6, v5, x, y);
  }
  if (!v5)
  {
    v12 = [(CRLUIScrollViewAccessibility *)self crlaxTarget];
    v13 = [v12 delegate];

    if (objc_opt_respondsToSelector()) {
      [v13 crlaxScrollView:self didScrollToContentOffsetWithoutAnimation:x, y];
    }
  }
}

- (BOOL)_accessibilityScrollStatusPrefersVertical
{
  if ([(CRLUIScrollViewAccessibility *)self crlaxScrollStatusPrefersHorizontal])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)CRLUIScrollViewAccessibility;
  return [(CRLUIScrollViewAccessibility *)&v4 _accessibilityScrollStatusPrefersVertical];
}

- (BOOL)accessibilityShouldEnableScrollIndicator:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLUIScrollViewAccessibility *)self accessibilityIdentifier];
  BOOL v6 = +[CRLAccessibility iOSBoardViewControllerScrollViewIdentifier];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLUIScrollViewAccessibility;
    BOOL v8 = [(CRLUIScrollViewAccessibility *)&v10 accessibilityShouldEnableScrollIndicator:v4];
  }

  return v8;
}

@end