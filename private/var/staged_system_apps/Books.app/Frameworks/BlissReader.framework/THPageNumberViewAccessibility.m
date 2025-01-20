@interface THPageNumberViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_thaxLabel;
- (int)_thaxMode;
- (void)p_updatePageString;
- (void)setPageNumberText:(id)a3;
@end

@implementation THPageNumberViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THPageNumberView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)setPageNumberText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THPageNumberViewAccessibility;
  -[THPageNumberViewAccessibility setPageNumberText:](&v5, "setPageNumberText:");
  [self _thaxLabel].accessibilityLabel = [NSString stringWithFormat:TSAccessibilityLocalizedString(@"page.number %@"), a3];
}

- (void)p_updatePageString
{
  v4.receiver = self;
  v4.super_class = (Class)THPageNumberViewAccessibility;
  [(THPageNumberViewAccessibility *)&v4 p_updatePageString];
  if ([(THPageNumberViewAccessibility *)self _thaxMode] == 1)
  {
    id v3 = [(THPageNumberViewAccessibility *)self _thaxLabel];
    [v3 setAccessibilityLabel:[NSString stringWithFormat:@"page.number %@" TSAccessibilityLocalizedString:@"page.number %@" [v3 text]]];
  }
}

- (id)_thaxLabel
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THPageNumberViewAccessibility *)self tsaxValueForKey:@"label"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (int)_thaxMode
{
  return [(THPageNumberViewAccessibility *)self tsaxIntValueForKey:@"mode"];
}

@end