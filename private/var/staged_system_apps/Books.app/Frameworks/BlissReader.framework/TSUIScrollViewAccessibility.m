@interface TSUIScrollViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityIsInTHBookView;
- (BOOL)_accessibilityScrollStatusPrefersVertical;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_accessibilityUseContentInset;
- (BOOL)_tsaxShouldSendScrollStatusUponAnimationEnded;
- (BOOL)accessibilityScrollLeftPage;
- (BOOL)accessibilityScrollRightPage;
- (double)_accessibilityScrollAnimationDurationDelay;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityScrollStatusFormatString;
- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation TSUIScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIScrollView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollLeftPage
{
  if (objc_msgSend(-[TSUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqual:", @"nestedVScrollView"))
  {
    id v3 = [(TSUIScrollViewAccessibility *)self superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 accessibilityScrollLeftPage]) {
      return 1;
    }
  }
  if ([(TSUIScrollViewAccessibility *)self _accessibilityIsInTHBookView]) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSUIScrollViewAccessibility;
  return [(TSUIScrollViewAccessibility *)&v5 accessibilityScrollLeftPage];
}

- (BOOL)accessibilityScrollRightPage
{
  if (objc_msgSend(-[TSUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqual:", @"nestedVScrollView"))
  {
    id v3 = [(TSUIScrollViewAccessibility *)self superview];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v3 accessibilityScrollRightPage] & 1) != 0)
    {
      return 1;
    }
  }
  if ([(TSUIScrollViewAccessibility *)self _accessibilityIsInTHBookView]) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSUIScrollViewAccessibility;
  return [(TSUIScrollViewAccessibility *)&v5 accessibilityScrollRightPage];
}

- (BOOL)_tsaxShouldSendScrollStatusUponAnimationEnded
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  if (([(TSUIScrollViewAccessibility *)self tsaxShouldIgnoreSiblingPageControl] & 1) == 0)
  {
    id v3 = [[-[TSUIScrollViewAccessibility superview](self, "superview") subviews];
    NSClassFromString(@"TSKPageControl");
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      id result = [v8 accessibilityValue];
      if (result) {
        return result;
      }
    }
  }
LABEL_12:
  v10.receiver = self;
  v10.super_class = (Class)TSUIScrollViewAccessibility;
  return [(TSUIScrollViewAccessibility *)&v10 _accessibilityScrollStatus];
}

- (id)_accessibilityScrollStatusFormatString
{
  id result = [(TSUIScrollViewAccessibility *)self tsaxScrollStatusFormatString];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSUIScrollViewAccessibility;
    return [(TSUIScrollViewAccessibility *)&v4 _accessibilityScrollStatusFormatString];
  }
  return result;
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  [(TSUIScrollViewAccessibility *)self tsaxScrollAnnouncementDelay];
  if (result <= 0.0)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSUIScrollViewAccessibility;
    [(TSUIScrollViewAccessibility *)&v4 _accessibilityScrollAnimationDurationDelay];
  }
  return result;
}

- (BOOL)_accessibilityUseContentInset
{
  v4.receiver = self;
  v4.super_class = (Class)TSUIScrollViewAccessibility;
  if ([(TSUIScrollViewAccessibility *)&v4 _accessibilityUseContentInset]) {
    return 1;
  }
  else {
    return [(TSUIScrollViewAccessibility *)self tsaxUseContentInset];
  }
}

- (BOOL)_accessibilityScrollingEnabled
{
  if ([(TSUIScrollViewAccessibility *)self tsaxIsScrollingDisabled])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIScrollViewAccessibility;
    BOOL v3 = [(TSUIScrollViewAccessibility *)&v5 _accessibilityScrollingEnabled];
    if (v3) {
      LOBYTE(v3) = [(TSUIScrollViewAccessibility *)self tsaxViewAncestorOfType:NSClassFromString(@"TSDMultiColumnTableViewCell")] == 0;
    }
  }
  return v3;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)TSUIScrollViewAccessibility;
  -[TSUIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animated:](&v10, "accessibilityApplyScrollContent:sendScrollStatus:animated:", a4);
  if (!a5)
  {
    id v9 = [(TSUIScrollViewAccessibility *)self tsaxValueForKey:@"delegate"];
    if (objc_opt_respondsToSelector()) {
      [v9 tsaxScrollView:self didScrollToContentOffsetWithoutAnimation:x, y];
    }
  }
}

- (BOOL)_accessibilityScrollStatusPrefersVertical
{
  if ([(TSUIScrollViewAccessibility *)self tsaxScrollStatusPrefersHorizontal])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)TSUIScrollViewAccessibility;
  return [(TSUIScrollViewAccessibility *)&v4 _accessibilityScrollStatusPrefersVertical];
}

- (BOOL)_accessibilityIsInTHBookView
{
  return [(TSUIScrollViewAccessibility *)self tsaxAncestorOfType:NSClassFromString(@"THBookView")] != 0;
}

@end