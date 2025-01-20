@interface TSADocumentManagerRenameDocTextFieldAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TSADocumentManagerRenameDocTextFieldAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerRenameDocTextField";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString(@"rename.text.field");
}

@end