@interface TSAInsertPopoverControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSSThemeAccessibility)_tsaxTheme;
- (void)_tsaxApplyLabel:(id)a3 toButton:(id)a4;
- (void)_tsaxApplyOrderedLabels:(id)a3 toButtons:(id)a4;
- (void)_tsaxMarkViewAsNestedVerticalScrollView:(id)a3;
- (void)p_populateChartsView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5 chartPage:(unint64_t)a6;
- (void)p_populateShapeView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5;
- (void)p_populateTablesView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5;
- (void)p_populateTextboxView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation TSAInsertPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAInsertPopoverController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  [(TSAInsertPopoverControllerAccessibility *)&v2 viewDidLoad];
}

- (void)p_populateShapeView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  [(TSAInsertPopoverControllerAccessibility *)&v7 p_populateShapeView:a3 pane:a4 withPresetIndex:a5];
  -[TSAInsertPopoverControllerAccessibility _tsaxApplyOrderedLabels:toButtons:](self, "_tsaxApplyOrderedLabels:toButtons:", -[TSSThemeAccessibility tsaxOrderedShapeDescriptions](-[TSAInsertPopoverControllerAccessibility _tsaxTheme](self, "_tsaxTheme"), "tsaxOrderedShapeDescriptions"), [a3 subviews]);
  [(TSAInsertPopoverControllerAccessibility *)self _tsaxMarkViewAsNestedVerticalScrollView:a3];
}

- (void)p_populateTablesView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  [(TSAInsertPopoverControllerAccessibility *)&v7 p_populateTablesView:a3 pane:a4 withPresetIndex:a5];
  -[TSAInsertPopoverControllerAccessibility _tsaxApplyOrderedLabels:toButtons:](self, "_tsaxApplyOrderedLabels:toButtons:", -[TSSThemeAccessibility tsaxOrderedTableDescriptions](-[TSAInsertPopoverControllerAccessibility _tsaxTheme](self, "_tsaxTheme"), "tsaxOrderedTableDescriptions"), [a3 subviews]);
  [(TSAInsertPopoverControllerAccessibility *)self _tsaxMarkViewAsNestedVerticalScrollView:a3];
}

- (void)p_populateTextboxView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  [(TSAInsertPopoverControllerAccessibility *)&v7 p_populateTextboxView:a3 pane:a4 withPresetIndex:a5];
  -[TSAInsertPopoverControllerAccessibility _tsaxApplyOrderedLabels:toButtons:](self, "_tsaxApplyOrderedLabels:toButtons:", -[TSSThemeAccessibility tsaxOrderedTextboxDescriptions](-[TSAInsertPopoverControllerAccessibility _tsaxTheme](self, "_tsaxTheme"), "tsaxOrderedTextboxDescriptions"), [a3 subviews]);
  [(TSAInsertPopoverControllerAccessibility *)self _tsaxMarkViewAsNestedVerticalScrollView:a3];
}

- (void)p_populateChartsView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5 chartPage:(unint64_t)a6
{
  v19.receiver = self;
  v19.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  -[TSAInsertPopoverControllerAccessibility p_populateChartsView:pane:withPresetIndex:chartPage:](&v19, "p_populateChartsView:pane:withPresetIndex:chartPage:", a3, a4, a5);
  id v9 = [a3 subviews];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = sub_259688;
  v17 = sub_259698;
  uint64_t v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2596A4;
  v12[3] = &unk_458E98;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v12)) {
    abort();
  }
  uint64_t v10 = v14[5];
  _Block_object_dispose(&v13, 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2596DC;
  v11[3] = &unk_4578E8;
  v11[4] = v10;
  v11[5] = self;
  [v9 enumerateObjectsUsingBlock:v11];
  [(TSAInsertPopoverControllerAccessibility *)self _tsaxMarkViewAsNestedVerticalScrollView:a3];
}

- (TSSThemeAccessibility)_tsaxTheme
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSSThemeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(objc_msgSend(-[TSAInsertPopoverControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"mDelegate"), "tsaxValueForKey:", @"documentRoot"), "tsaxValueForKey:", @"theme"), 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)_tsaxApplyOrderedLabels:(id)a3 toButtons:(id)a4
{
  id v7 = [a3 count];
  if (v7 == [a4 count])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_259930;
    v15[3] = &unk_4578E8;
    v15[4] = a3;
    v15[5] = self;
    [a4 enumerateObjectsUsingBlock:v15];
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    id v9 = [a3 count];
    [a4 count];
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Number of buttons has changed from %lu to %lu", v10, v11, v12, v13, v14, (uint64_t)v9))abort(); {
  }
    }
}

- (void)_tsaxApplyLabel:(id)a3 toButton:(id)a4
{
  [a4 setIsAccessibilityElement:1];
  [a4 setAccessibilityLabel:a3];
  unint64_t v6 = (unint64_t)[a4 accessibilityTraits];
  UIAccessibilityTraits v7 = UIAccessibilityTraitButton | v6;

  [a4 setAccessibilityTraits:v7];
}

- (void)_tsaxMarkViewAsNestedVerticalScrollView:(id)a3
{
}

@end