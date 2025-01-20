@interface THWPageControlRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxSelectPageAtIndex:(unint64_t)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxDecrementPage;
- (BOOL)thaxIncrementPage;
- (BOOL)thaxShouldHideChildReps;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unint64_t)thaxCurrentPage;
- (unint64_t)thaxNumberOfPages;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation THWPageControlRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString(@"page.control");
}

- (id)accessibilityValue
{
  id v3 = TSAccessibilityLocalizedUnsignedInteger((uint64_t)[(THWPageControlRepAccessibility *)self thaxCurrentPage] + 1);
  id v4 = TSAccessibilityLocalizedUnsignedInteger([(THWPageControlRepAccessibility *)self thaxNumberOfPages]);
  return +[NSString stringWithFormat:THAccessibilityLocalizedString(@"page.control.value.format %@ %@"), v3, v4];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

+ (id)tsaxTargetClassName
{
  return @"THWPageControlRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxCurrentPage
{
  v2 = [(THTSDRepAccessibility *)self tsaxLayout];

  return (unint64_t)[(THTSDLayoutAccessibility *)v2 tsaxUnsignedIntegerValueForKey:@"currentPage"];
}

- (unint64_t)thaxNumberOfPages
{
  v2 = [(THTSDRepAccessibility *)self tsaxLayout];

  return (unint64_t)[(THTSDLayoutAccessibility *)v2 tsaxUnsignedIntegerValueForKey:@"numberOfPages"];
}

- (BOOL)thaxIncrementPage
{
  id v3 = (char *)[(THWPageControlRepAccessibility *)self thaxCurrentPage] + 1;

  return [(THWPageControlRepAccessibility *)self _thaxSelectPageAtIndex:v3];
}

- (BOOL)thaxDecrementPage
{
  id v3 = (char *)[(THWPageControlRepAccessibility *)self thaxCurrentPage] - 1;

  return [(THWPageControlRepAccessibility *)self _thaxSelectPageAtIndex:v3];
}

- (BOOL)_thaxSelectPageAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(THWPageControlRepAccessibility *)self thaxNumberOfPages];
  if (v5 - 1 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5 - 1;
  }
  unint64_t v7 = [(THWPageControlRepAccessibility *)self thaxCurrentPage];
  if (v7 != v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_29AF6C;
    v9[3] = &unk_457250;
    v9[4] = self;
    v9[5] = v6;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v9)) {
      abort();
    }
  }
  return v7 != v6;
}

@end