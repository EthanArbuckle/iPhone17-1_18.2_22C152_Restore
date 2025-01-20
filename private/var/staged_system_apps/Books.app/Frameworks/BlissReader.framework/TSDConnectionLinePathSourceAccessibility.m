@interface TSDConnectionLinePathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxInferredLabel;
@end

@implementation TSDConnectionLinePathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDConnectionLinePathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxInferredLabel
{
  return TSAccessibilityLocalizedString(@"ConnectionLine");
}

@end