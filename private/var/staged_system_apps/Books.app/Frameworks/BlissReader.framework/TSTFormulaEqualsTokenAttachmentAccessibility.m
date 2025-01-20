@interface TSTFormulaEqualsTokenAttachmentAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxStringRepresentation;
@end

@implementation TSTFormulaEqualsTokenAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTFormulaEqualsTokenAttachment";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxStringRepresentation
{
  return TSAccessibilityLocalizedString(@"formula.equals.token.title");
}

@end