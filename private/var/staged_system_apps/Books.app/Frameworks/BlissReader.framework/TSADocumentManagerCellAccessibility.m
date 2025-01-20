@interface TSADocumentManagerCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
- (void)tsaxChildWillBeRemoved:(id)a3;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation TSADocumentManagerCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)dealloc
{
  [(TSADocumentManagerCellAccessibility *)self tsaxInvalidateChildrenImmediately];
  v3.receiver = self;
  v3.super_class = (Class)TSADocumentManagerCellAccessibility;
  [(TSADocumentManagerCellAccessibility *)&v3 dealloc];
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v5 = [(TSADocumentManagerCellAccessibility *)self tsaxValueForKey:@"_imageLayer"];
  if (v5)
  {
    id v6 = v5;
    [v5 setAccessibilityContainer:self];
    [a3 addObject:v6];
  }
  id v7 = [(TSADocumentManagerCellAccessibility *)self tsaxValueForKey:@"_labelLayer"];
  if (v7)
  {
    id v8 = v7;
    [v7 setAccessibilityContainer:self];
    [a3 addObject:v8];
  }
}

- (id)accessibilityLabel
{
  id v2 = [(TSADocumentManagerCellAccessibility *)self tsaxValueForKey:@"_labelLayer"];
  id v3 = [v2 tsaxValueForKey:@"_text"];
  id v4 = [v2 tsaxValueForKey:@"_dateString"];
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)TSADocumentManagerCellAccessibility;
  unint64_t v3 = [(TSADocumentManagerCellAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(TSADocumentManagerCellAccessibility *)self tsaxBoolValueForKey:@"isSelected"];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

@end