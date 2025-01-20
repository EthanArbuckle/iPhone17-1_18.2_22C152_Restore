@interface THWGutterRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSString)tsaxLabel;
- (THWGutterInfoAccessibility)tsaxInfo;
- (id)_thaxPressableHandler;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation THWGutterRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWGutterRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLabel
{
  v2 = [(THWGutterRepAccessibility *)self tsaxInfo];

  return [(THWGutterInfoAccessibility *)v2 thaxAuthorProvidedDescription];
}

- (THWGutterInfoAccessibility)tsaxInfo
{
  char v7 = 0;
  v3 = objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)THWGutterRepAccessibility;
  id v4 = [(TSDRepAccessibility *)&v6 tsaxInfo];
  result = (THWGutterInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v6 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWGutterRepAccessibility *)self tsaxInfo], 1, &v6);
  if (v6) {
    abort();
  }
  return objc_msgSend(objc_msgSend(-[objc_class thaxTitleShape](v4, "thaxTitleShape"), "tsaxContainedStorage"), "tsaxString");
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString(@"widgets.gutter.rep.hint.iOS");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (id)_thaxPressableHandler
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"pressableHandler"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end