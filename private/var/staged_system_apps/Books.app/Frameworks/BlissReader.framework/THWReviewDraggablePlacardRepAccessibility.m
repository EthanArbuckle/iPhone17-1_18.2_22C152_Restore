@interface THWReviewDraggablePlacardRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxIsRepPressable;
- (BOOL)thaxShouldHideChildReps;
- (NSString)thaxContentImageAccessibilityDescription;
- (THTSWPRepAccessibility)thaxContentTextRep;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)thaxIndex;
@end

@implementation THWReviewDraggablePlacardRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewDraggablePlacardRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxIndex
{
  v2 = [(THTSDRepAccessibility *)self tsaxLayout];

  return (unint64_t)[(THTSDLayoutAccessibility *)v2 tsaxUnsignedIntegerValueForKey:@"index"];
}

- (THTSWPRepAccessibility)thaxContentTextRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THTSWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"contentTextRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxContentImageAccessibilityDescription
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTSDLayoutAccessibility *)[(THTSDRepAccessibility *)self tsaxLayout] tsaxValueForKey:@"contentImageAccessibilityDescription"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxIsRepPressable
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(THWReviewDraggablePlacardRepAccessibility *)self thaxContentTextRep];
  if (v3)
  {
    v4 = [(TSWPRepAccessibility *)v3 tsaxStorage];
    return [(TSWPStorageAccessibility *)v4 tsaxString];
  }
  else
  {
    v6 = [(THWReviewDraggablePlacardRepAccessibility *)self thaxContentImageAccessibilityDescription];
    if ([(NSString *)v6 length])
    {
      return v6;
    }
    else
    {
      v7 = THAccessibilityLocalizedString(@"widgets.review.callout.option.image.label %@");
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, TSAccessibilityLocalizedUnsignedInteger((uint64_t)[(THWReviewDraggablePlacardRepAccessibility *)self thaxIndex] + 1));
    }
  }
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString(@"widgets.review.callout.drag.hint.ios");
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

@end