@interface TSKPageControlAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSKPageControlAccessibilityValueDescriptionDelegate)tsaxValueDescriptionDelegate;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axMoveToPage:(int64_t)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)tsaxSetValueDescriptionDelegate:(id)a3;
@end

@implementation TSKPageControlAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKPageControl";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSKPageControlAccessibilityValueDescriptionDelegate)tsaxValueDescriptionDelegate
{
  return (TSKPageControlAccessibilityValueDescriptionDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_5739F0);
}

- (void)tsaxSetValueDescriptionDelegate:(id)a3
{
}

- (void)_axMoveToPage:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(TSKPageControlAccessibility *)self setCurrentPage:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(TSKPageControlAccessibility *)self sendActionsForControlEvents:1];
      [(TSKPageControlAccessibility *)self sendActionsForControlEvents:4096];
      [(TSKPageControlAccessibility *)self sendActionsForControlEvents:64];
    }
  }
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TSKPageControlAccessibility;
  return UIAccessibilityTraitAdjustable | [(TSKPageControlAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
  objc_super v3 = (char *)[(TSKPageControlAccessibility *)self tsaxIntegerValueForKey:@"currentPage"];
  if ((uint64_t)v3 < (uint64_t)((char *)[(TSKPageControlAccessibility *)self tsaxIntegerValueForKey:@"numberOfPages"]- 1))
  {
    [(TSKPageControlAccessibility *)self _axMoveToPage:v3 + 1];
  }
}

- (void)accessibilityDecrement
{
  objc_super v3 = (char *)[(TSKPageControlAccessibility *)self tsaxIntegerValueForKey:@"currentPage"];
  if ((uint64_t)v3 >= 1)
  {
    [(TSKPageControlAccessibility *)self _axMoveToPage:v3 - 1];
  }
}

- (id)accessibilityValue
{
  uint64_t v3 = (uint64_t)[(TSKPageControlAccessibility *)self tsaxIntegerValueForKey:@"currentPage"];
  uint64_t v4 = v3 & ~(v3 >> 63);
  uint64_t v5 = (uint64_t)[(TSKPageControlAccessibility *)self tsaxIntegerValueForKey:@"numberOfPages"];
  uint64_t v6 = v5 & ~(v5 >> 63);
  v7 = [(TSKPageControlAccessibility *)self tsaxValueDescriptionDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = [(TSKPageControlAccessibilityValueDescriptionDelegate *)v7 tsaxValueForPageControl:self pageIndex:v4 numberOfPages:v6]) == 0)
  {
    v9 = TSAccessibilityLocalizedString(@"page.number.of.number %@ %@");
    id v10 = TSAccessibilityLocalizedUnsignedInteger(v4 + 1);
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10, TSAccessibilityLocalizedUnsignedInteger(v6));
  }
  return result;
}

@end