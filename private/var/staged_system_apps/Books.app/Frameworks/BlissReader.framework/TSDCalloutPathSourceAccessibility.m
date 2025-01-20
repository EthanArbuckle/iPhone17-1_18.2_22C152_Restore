@interface TSDCalloutPathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxInferredLabel;
@end

@implementation TSDCalloutPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDCalloutPathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxInferredLabel
{
  if ([(TSDCalloutPathSourceAccessibility *)self tsaxBoolValueForKey:@"isTailAtCenter"])CFStringRef v2 = @"RoundQuoteBubble"; {
  else
  }
    CFStringRef v2 = @"BoxQuoteBubble";

  return TSAccessibilityLocalizedString((uint64_t)v2);
}

@end