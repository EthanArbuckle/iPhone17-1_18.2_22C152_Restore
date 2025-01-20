@interface TSWPListStylePresetsInspectorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)p_listIndentCells;
@end

@implementation TSWPListStylePresetsInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPListStylePresetsInspectorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)p_listIndentCells
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPListStylePresetsInspectorControllerAccessibility;
  id v2 = [(TSWPListStylePresetsInspectorControllerAccessibility *)&v7 p_listIndentCells];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 count])
    {
      id v3 = objc_msgSend(objc_msgSend(objc_msgSend(v2, "objectAtIndex:", 0), "tsaxValueForKey:", @"segmentedControl"), "tsaxValueForKey:", @"mButtonSegments");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [v3 objectAtIndex:0];
        id v5 = [v3 objectAtIndex:1];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 setAccessibilityLabel:TSAccessibilityLocalizedString(@"outdent.button")];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 setAccessibilityLabel:TSAccessibilityLocalizedString(@"indent.button")];
        }
      }
    }
  }
  return v2;
}

@end