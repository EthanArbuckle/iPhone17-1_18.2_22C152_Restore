@interface THWButtonControlRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxIsDisabled;
- (BOOL)thaxIsRepPressable;
- (BOOL)thaxIsSelected;
- (BOOL)thaxPressRep;
- (NSString)thaxHint;
- (NSString)tsaxLabel;
- (id)accessibilityHint;
- (id)thaxDelegate;
- (id)thaxLayout;
- (unint64_t)accessibilityTraits;
- (unint64_t)thaxIndex;
- (unint64_t)thaxTag;
@end

@implementation THWButtonControlRepAccessibility

- (BOOL)isAccessibilityElement
{
  if (objc_opt_respondsToSelector()) {
    return [self thaxDelegate].thaxButtonControlRepIsIgnored:self] ^ 1;
  }
  else {
    return 1;
  }
}

- (id)accessibilityHint
{
  return [(THWButtonControlRepAccessibility *)self thaxHint];
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3 = UIAccessibilityTraitButton;
  unsigned int v4 = [(THWButtonControlRepAccessibility *)self thaxIsSelected];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  UIAccessibilityTraits v6 = v5 | v3;
  unsigned int v7 = [(THWButtonControlRepAccessibility *)self thaxIsDisabled];
  UIAccessibilityTraits v8 = UIAccessibilityTraitNotEnabled;
  if (!v7) {
    UIAccessibilityTraits v8 = 0;
  }
  return v6 | v8;
}

- (BOOL)thaxIsRepPressable
{
  return ![(THWButtonControlRepAccessibility *)self thaxIsDisabled];
}

+ (id)tsaxTargetClassName
{
  return @"THWButtonControlRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxHint
{
  if ([0 length]) {
    return 0;
  }
  [(THWButtonControlRepAccessibility *)self thaxDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(THWButtonControlRepAccessibility *)self thaxDelegate];

  return (NSString *)[v3 thaxHintForButtonControlRep:self];
}

- (BOOL)thaxIsDisabled
{
  return [(THWButtonControlRepAccessibility *)self tsaxBoolValueForKey:@"p_interactionEnabled"] ^ 1;
}

- (NSString)tsaxLabel
{
  if ([0 length]) {
    return 0;
  }
  [(THWButtonControlRepAccessibility *)self thaxDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(THWButtonControlRepAccessibility *)self thaxDelegate];

  return (NSString *)[v3 thaxLabelForButtonControlRep:self];
}

- (BOOL)thaxIsSelected
{
  [(THWButtonControlRepAccessibility *)self thaxDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(THWButtonControlRepAccessibility *)self thaxDelegate];

  return [v3 thaxButtonControlRepIsSelected:self];
}

- (id)thaxDelegate
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"delegate"];
}

- (id)thaxLayout
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"layout"];
}

- (unint64_t)thaxTag
{
  id v2 = [(THWButtonControlRepAccessibility *)self thaxLayout];

  return (unint64_t)[v2 tsaxUnsignedIntegerValueForKey:@"tag"];
}

- (unint64_t)thaxIndex
{
  id v2 = [(THWButtonControlRepAccessibility *)self thaxLayout];

  return (unint64_t)[v2 tsaxUnsignedIntegerValueForKey:@"index"];
}

- (BOOL)thaxPressRep
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_295A20;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  return 1;
}

@end