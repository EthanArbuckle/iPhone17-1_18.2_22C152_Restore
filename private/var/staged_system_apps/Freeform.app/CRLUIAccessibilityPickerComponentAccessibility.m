@interface CRLUIAccessibilityPickerComponentAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (UIPickerView)crlaxPickerView;
@end

@implementation CRLUIAccessibilityPickerComponentAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIAccessibilityPickerComponent";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIPickerView)crlaxPickerView
{
  return (UIPickerView *)[(CRLUIAccessibilityPickerComponentAccessibility *)self picker];
}

@end