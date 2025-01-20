@interface TSDShadowSwatchAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxLocalizedNumberForKey:(id)a3 withShadow:(id)a4;
- (id)_tsaxLocalizedNumberForKey:(id)a3 withShadow:(id)a4 isPercentage:(BOOL)a5;
- (id)accessibilityLabel;
@end

@implementation TSDShadowSwatchAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShadowSwatch";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxLocalizedNumberForKey:(id)a3 withShadow:(id)a4
{
  return [(TSDShadowSwatchAccessibility *)self _tsaxLocalizedNumberForKey:a3 withShadow:a4 isPercentage:0];
}

- (id)_tsaxLocalizedNumberForKey:(id)a3 withShadow:(id)a4 isPercentage:(BOOL)a5
{
  [a4 tsaxCGFloatValueForKey:a3];
  if (a5)
  {
    return TSAccessibilityLocalizedPercent();
  }
  else
  {
    v8 = +[NSNumber numberWithInteger:llround(v6)];
    return TSAccessibilityLocalizedNumber((uint64_t)v8);
  }
}

- (id)accessibilityLabel
{
  id v3 = [(TSDShadowSwatchAccessibility *)self tsaxValueForKey:@"shadow"];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(@"shadow.formatter %@ %@ %@ %@"), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:](self, "_tsaxLocalizedNumberForKey:withShadow:", @"angle", v3), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:](self, "_tsaxLocalizedNumberForKey:withShadow:", @"offset", v3), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:](self, "_tsaxLocalizedNumberForKey:withShadow:", @"radius", v3), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:isPercentage:](
             self,
             "_tsaxLocalizedNumberForKey:withShadow:isPercentage:",
             @"opacity",
             v3,
             1));
}

@end