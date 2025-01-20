@interface THTSDLayoutAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIsExpanded;
@end

@implementation THTSDLayoutAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDLayout";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxIsExpanded
{
  unsigned int v3 = [(THTSDLayoutAccessibility *)self conformsToProtocol:NSProtocolFromString(@"THWWidgetLayout")];
  if (v3)
  {
    LOBYTE(v3) = [(THTSDLayoutAccessibility *)self tsaxBoolValueForKey:@"isExpanded"];
  }
  return v3;
}

@end