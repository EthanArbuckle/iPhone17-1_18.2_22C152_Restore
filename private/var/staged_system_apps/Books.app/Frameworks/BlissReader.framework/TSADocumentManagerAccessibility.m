@interface TSADocumentManagerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)openDocumentForInfo:(id)a3 animated:(BOOL)a4;
@end

@implementation TSADocumentManagerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManager";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)openDocumentForInfo:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentManagerAccessibility;
  BOOL v4 = [(TSADocumentManagerAccessibility *)&v6 openDocumentForInfo:a3 animated:a4];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  return v4;
}

@end