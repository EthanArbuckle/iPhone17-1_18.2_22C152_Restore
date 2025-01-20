@interface TSDReflectionAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxDescription;
- (double)_tsaxOpacity;
@end

@implementation TSDReflectionAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDReflection";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxDescription
{
  v3 = TSAccessibilityLocalizedString(@"reflection.with.opacity %@");
  [(TSDReflectionAccessibility *)self _tsaxOpacity];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, TSAccessibilityLocalizedPercent());
}

- (double)_tsaxOpacity
{
  [(TSDReflectionAccessibility *)self tsaxCGFloatValueForKey:@"mOpacity"];
  return result;
}

@end