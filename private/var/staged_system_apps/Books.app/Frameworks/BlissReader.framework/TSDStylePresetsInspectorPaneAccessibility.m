@interface TSDStylePresetsInspectorPaneAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TSDStylePresetsInspectorPaneAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDStylePresetsInspectorPane";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TSDStylePresetsInspectorPaneAccessibility;
  [(TSDStylePresetsInspectorPaneAccessibility *)&v13 viewDidAppear:a3];
  id v4 = [(TSDStylePresetsInspectorPaneAccessibility *)self tsaxValueForKey:@"mButtons"];
  id v5 = [(TSDStylePresetsInspectorPaneAccessibility *)self tsaxValueForKey:@"presets"];
  [(TSDStylePresetsInspectorPaneAccessibility *)self tsaxValueForKey:@"delegate"];
  v6 = (char *)[v4 count];
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      id v9 = [v4 objectAtIndex:i];
      if (!objc_msgSend(objc_msgSend(v9, "accessibilityLabel"), "length"))
      {
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v9, "setAccessibilityLabel:", objc_msgSend(objc_msgSend(v5, "objectAtIndex:", i), "accessibilityLabel"));
        }
        else
        {
          id v10 = objc_alloc((Class)NSString);
          v11 = TSAccessibilityLocalizedString(@"style.label.formatter %@");
          id v12 = [v10 initWithFormat:v11 TSAccessibilityLocalizedUnsignedInteger:(uint64_t)(i + 1)];
          [v9 setAccessibilityLabel:v12];
        }
      }
    }
  }
}

@end