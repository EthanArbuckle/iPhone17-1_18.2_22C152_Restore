@interface AXUIViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_accessibilityEscape;
- (BOOL)_accessibilityReadAllOnFocus;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
@end

@implementation AXUIViewAccessibility

+ (id)imaxTargetClassName
{
  return @"UIView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  v3 = [(AXUIViewAccessibility *)self imaxIdentification];
  unsigned int v4 = [v3 isEqualToString:@"EscapableWindow"];

  if (v4)
  {
    v5 = [(AXUIViewAccessibility *)self imaxValueForKey:@"_viewDelegate"];
    if (objc_opt_respondsToSelector())
    {
      [v5 dismissPopoverAnimated:0];

      return 1;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)AXUIViewAccessibility;
  return [(AXUIViewAccessibility *)&v7 accessibilityPerformEscape];
}

- (BOOL)_accessibilityEscape
{
  return [(AXUIViewAccessibility *)self _accessibilityEscape];
}

- (BOOL)_accessibilityReadAllOnFocus
{
  v3 = [(AXUIViewAccessibility *)self imaxIdentification];
  unsigned __int8 v4 = [v3 isEqualToString:@"PreviewContentView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AXUIViewAccessibility;
  return [(AXUIViewAccessibility *)&v6 _accessibilityReadAllOnFocus];
}

- (BOOL)accessibilityActivate
{
  v3 = [(AXUIViewAccessibility *)self imaxIdentification];
  unsigned int v4 = [v3 isEqualToString:@"EscapableWindow"];

  if (v4)
  {
    return [(AXUIViewAccessibility *)self accessibilityPerformEscape];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AXUIViewAccessibility;
    return [(AXUIViewAccessibility *)&v6 accessibilityActivate];
  }
}

@end