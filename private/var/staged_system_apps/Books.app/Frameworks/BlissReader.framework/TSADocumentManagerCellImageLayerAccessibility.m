@interface TSADocumentManagerCellImageLayerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TSADocumentManagerCellImageLayerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerCellImageLayer";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2 = [(TSADocumentManagerCellImageLayerAccessibility *)self accessibilityContainer];

  return [v2 accessibilityLabel];
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString(@"grid.cell.document.hint.iOS");
}

- (unint64_t)accessibilityTraits
{
  id v2 = [(TSADocumentManagerCellImageLayerAccessibility *)self accessibilityContainer];

  return (unint64_t)[v2 accessibilityTraits];
}

@end