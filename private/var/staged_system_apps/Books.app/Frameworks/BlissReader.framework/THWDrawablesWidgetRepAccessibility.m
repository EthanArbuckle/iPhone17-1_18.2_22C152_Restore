@interface THWDrawablesWidgetRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (NSString)thaxWidgetDescription;
- (THWDrawablesWidgetInfoAccessibility)thaxDrawablesWidgetInfo;
- (id)accessibilityLabel;
@end

@implementation THWDrawablesWidgetRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(THWDrawablesWidgetRepAccessibility *)self thaxWidgetDescription];
}

+ (id)tsaxTargetClassName
{
  return @"THWDrawablesWidgetRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxWidgetDescription
{
  v2 = [(THWDrawablesWidgetRepAccessibility *)self thaxDrawablesWidgetInfo];

  return [(THWDrawablesWidgetInfoAccessibility *)v2 thaxWidgetDescription];
}

- (THWDrawablesWidgetInfoAccessibility)thaxDrawablesWidgetInfo
{
  v3 = objc_opt_class();
  id v4 = [(TSDRepAccessibility *)self tsaxInfo];

  return (THWDrawablesWidgetInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);
}

@end