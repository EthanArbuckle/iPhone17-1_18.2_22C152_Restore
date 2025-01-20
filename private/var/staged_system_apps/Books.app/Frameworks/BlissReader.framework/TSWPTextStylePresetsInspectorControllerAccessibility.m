@interface TSWPTextStylePresetsInspectorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)cellWithParagraphAlignmentControlsForInspector:(id)a3 editor:(id)a4;
+ (id)cellWithParagraphAlignmentControlsIncludeVerticalAlignment:(BOOL)a3 inspector:(id)a4 editor:(id)a5;
+ (id)cellWithVerticalAlignmentControlsForInspector:(id)a3 editor:(id)a4;
+ (id)tsaxTargetClassName;
+ (void)_tsaxLabelOptionsInParagraphAlignSegmentedControl:(id)a3;
+ (void)_tsaxLabelOptionsInVerticalAlignSegmentedControl:(id)a3;
@end

@implementation TSWPTextStylePresetsInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPTextStylePresetsInspectorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)cellWithParagraphAlignmentControlsIncludeVerticalAlignment:(BOOL)a3 inspector:(id)a4 editor:(id)a5
{
  BOOL v5 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___TSWPTextStylePresetsInspectorControllerAccessibility;
  id v7 = [super cellWithParagraphAlignmentControlsIncludeVerticalAlignment:a3 inspector:a4 editor:a5];
  if (!v5)
  {
    char v16 = 0;
    v13 = objc_opt_class();
    Class v14 = __TSAccessibilityCastAsSafeCategory(v13, (uint64_t)v7, 1, &v16);
    if (!v16)
    {
      id v11 = [(objc_class *)v14 tsaxSegmentedControl];
      id v12 = 0;
      if (!v11) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_11:
    abort();
  }
  char v16 = 0;
  v8 = objc_opt_class();
  Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 1, &v16);
  if (v16) {
    goto LABEL_11;
  }
  Class v10 = v9;
  id v11 = [(objc_class *)v9 tsaxLeftSegmentedControl];
  id v12 = [(objc_class *)v10 tsaxRightSegmentedControl];
  if (v11) {
LABEL_7:
  }
    [a1 _tsaxLabelOptionsInParagraphAlignSegmentedControl:v11];
LABEL_8:
  if (v12) {
    [a1 _tsaxLabelOptionsInVerticalAlignSegmentedControl:v12];
  }
  return v7;
}

+ (id)cellWithParagraphAlignmentControlsForInspector:(id)a3 editor:(id)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TSWPTextStylePresetsInspectorControllerAccessibility;
  id v5 = [super cellWithParagraphAlignmentControlsForInspector:a3 editor:a4];
  char v9 = 0;
  v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v9);
  if (v9) {
    abort();
  }
  [a1 _tsaxLabelOptionsInParagraphAlignSegmentedControl:[objc_class tsaxSegmentedControl]];
  return v5;
}

+ (id)cellWithVerticalAlignmentControlsForInspector:(id)a3 editor:(id)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TSWPTextStylePresetsInspectorControllerAccessibility;
  [super cellWithVerticalAlignmentControlsForInspector:a3 editor:a4];
  char v9 = 0;
  v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v9);
  if (v9) {
    abort();
  }
  [a1 _tsaxLabelOptionsInVerticalAlignSegmentedControl:[objc_class tsaxSegmentedControl]];
  return v5;
}

+ (void)_tsaxLabelOptionsInParagraphAlignSegmentedControl:(id)a3
{
  if ([a3 tsaxSegmentCount] == (char *)&dword_4 + 1)
  {
    v14[0] = TSAccessibilityLocalizedString(@"paragraph.align.left");
    v14[1] = TSAccessibilityLocalizedString(@"paragraph.align.center");
    v14[2] = TSAccessibilityLocalizedString(@"paragraph.align.right");
    v14[3] = TSAccessibilityLocalizedString(@"paragraph.align.natural");
    v14[4] = TSAccessibilityLocalizedString(@"paragraph.align.right.to.left");
    v4 = v14;
    uint64_t v5 = 5;
LABEL_5:
    [a3 tsaxSetSegmentDescriptions:[NSArray arrayWithObjects:count:v4, v5]];
    return;
  }
  if ([a3 tsaxSegmentCount] == &dword_4)
  {
    v13[0] = TSAccessibilityLocalizedString(@"paragraph.align.left");
    v13[1] = TSAccessibilityLocalizedString(@"paragraph.align.center");
    v13[2] = TSAccessibilityLocalizedString(@"paragraph.align.right");
    v13[3] = TSAccessibilityLocalizedString(@"paragraph.align.natural");
    v4 = v13;
    uint64_t v5 = 4;
    goto LABEL_5;
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    id v7 = [a3 tsaxSegmentCount];
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unexpected segment count: %lu", v8, v9, v10, v11, v12, (uint64_t)v7))abort(); {
  }
    }
}

+ (void)_tsaxLabelOptionsInVerticalAlignSegmentedControl:(id)a3
{
  uint64_t v5 = TSAccessibilityLocalizedString(@"vertical.align.top");
  v6 = TSAccessibilityLocalizedString(@"vertical.align.middle");
  id v7 = TSAccessibilityLocalizedString(@"vertical.align.bottom");
  v4 = +[NSArray arrayWithObjects:&v5 count:3];
  [a3 tsaxSetSegmentDescriptions:v4, v5, v6];
}

@end