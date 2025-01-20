@interface TIATemplateChooserViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TIATemplateChooserViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TIATemplateChooserViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TIATemplateChooserViewCellAccessibility *)self tsaxValueForKey:@"label"], 1, &v6);
  if (v6) {
    abort();
  }
  return [v4 text];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TIATemplateChooserViewCellAccessibility;
  return UIAccessibilityTraitButton | [(TIATemplateChooserViewCellAccessibility *)&v3 accessibilityTraits];
}

@end