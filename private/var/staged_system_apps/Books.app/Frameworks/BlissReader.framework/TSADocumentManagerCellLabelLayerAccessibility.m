@interface TSADocumentManagerCellLabelLayerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TSADocumentManagerCellLabelLayerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerCellLabelLayer";
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
  id result = [(TSADocumentManagerCellLabelLayerAccessibility *)self tsaxValueForKey:@"_text"];
  if (result) {
    return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"rename.label %@"), result];
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString(@"grid.cell.document.edit.name.hint.iOS");
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  id v2 = [(TSADocumentManagerCellLabelLayerAccessibility *)self tsaxValueForKey:@"_cell"];
  if (v2)
  {
    id v3 = v2;
    id v4 = [v2 tsaxValueForKey:@"_gridView"];
    id v5 = [v4 tsaxValueForKey:@"gridDelegate"];
    if (objc_opt_respondsToSelector())
    {
      [v5 gridView:v4 didTapNameForCell:v3];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        LOBYTE(v2) = 0;
        return (char)v2;
      }
      [v5 gridView:v4 didTapCell:v3];
    }
    LOBYTE(v2) = 1;
  }
  return (char)v2;
}

@end