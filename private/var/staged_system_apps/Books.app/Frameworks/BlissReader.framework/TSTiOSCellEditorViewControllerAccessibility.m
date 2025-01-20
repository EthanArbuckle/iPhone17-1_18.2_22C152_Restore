@interface TSTiOSCellEditorViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)viewDidLoad;
@end

@implementation TSTiOSCellEditorViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTiOSCellEditorViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)TSTiOSCellEditorViewControllerAccessibility;
  [(TSTiOSCellEditorViewControllerAccessibility *)&v18 viewDidLoad];
  [-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mBackSegment", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"expand.input.types")];
  [-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mNumberSegment", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"numbers.input")];
  [-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mDateDurationSegment", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"date.and.duration.input")];
  [-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mTextSegment", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"text.input")];
  [-[TSTiOSCellEditorViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mFormulaSegment", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"equation.input")];
  id v3 = [(TSTiOSCellEditorViewControllerAccessibility *)self tsaxValueForKey:@"mDoneCancelSubView"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 subviews];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = [v9 actionsForTarget:self forControlEvent:64];
            unsigned __int8 v11 = [v10 containsObject:@"done:"];
            CFStringRef v12 = @"done.button";
            if ((v11 & 1) != 0
              || (unsigned int v13 = [v10 containsObject:@"cancel:"],
                  CFStringRef v12 = @"cancel.button",
                  v13))
            {
              [v9 setAccessibilityLabel:TSAccessibilityLocalizedString((uint64_t)v12)];
            }
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
  }
}

@end