@interface TSACalloutViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSACalloutViewAccessibility)init;
- (void)setExcludeTitlesFromButtons:(BOOL)a3;
@end

@implementation TSACalloutViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSACalloutView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)setExcludeTitlesFromButtons:(BOOL)a3
{
  BOOL v3 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)TSACalloutViewAccessibility;
    [(TSACalloutViewAccessibility *)&v5 setExcludeTitlesFromButtons:v3];
  }
}

- (TSACalloutViewAccessibility)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSACalloutViewAccessibility;
  v2 = [(TSACalloutViewAccessibility *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)TSACalloutViewAccessibility;
    [(TSACalloutViewAccessibility *)&v5 setExcludeTitlesFromButtons:1];
  }
  return v3;
}

@end