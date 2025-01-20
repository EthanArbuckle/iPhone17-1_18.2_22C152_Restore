@interface TSDSmartStrokeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxStrokePatternDescription;
@end

@implementation TSDSmartStrokeAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDSmartStroke";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxStrokePatternDescription
{
  v2 = +[NSString stringWithFormat:@"stroke.%@", [(TSDSmartStrokeAccessibility *)self tsaxValueForKey:@"strokeName"]];

  return TSAccessibilityLocalizedString((uint64_t)v2);
}

@end